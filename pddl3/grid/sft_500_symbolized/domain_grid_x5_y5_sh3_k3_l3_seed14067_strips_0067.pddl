(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v10)
             (pred_11 ?v8 ?v2)
             (pred_6 ?v9 ?v2)
             (pred_9 ?v5 ?v9 )
	     (pred_1 ?v9)
             (pred_3 ?v13)
             (pred_2 ?v8)
             (pred_12 ?v2)
             (pred_7 ?v9)
             (pred_8 ?v8)
             (pred_5 ?v9)
             (pred_4 ))



(:action op_5
:parameters (?v11 ?v1 ?v6 ?v12)
:precondition (and (pred_3 ?v11) (pred_3 ?v1) (pred_2 ?v6) (pred_12 ?v12)
          (pred_10 ?v11 ?v1) (pred_11 ?v6 ?v12)
                   (pred_6 ?v1 ?v12) (pred_1 ?v11) 
                   (pred_7 ?v1) (pred_8 ?v6))
:effect (and  (pred_5 ?v1) (not (pred_7 ?v1))))


(:action op_2
:parameters (?v11 ?v3)
:precondition (and (pred_3 ?v11) (pred_3 ?v3)
               (pred_1 ?v11) (pred_10 ?v11 ?v3) (pred_5 ?v3))
:effect (and (pred_1 ?v3) (not (pred_1 ?v11))))

(:action op_1
:parameters (?v11 ?v6)
:precondition (and (pred_3 ?v11) (pred_2 ?v6) 
                  (pred_1 ?v11) (pred_9 ?v6 ?v11) (pred_4 ))
:effect (and (pred_8 ?v6)
   (not (pred_9 ?v6 ?v11)) (not (pred_4 ))))


(:action op_3
:parameters (?v11 ?v4 ?v7)
:precondition (and (pred_3 ?v11) (pred_2 ?v4) (pred_2 ?v7)
                  (pred_1 ?v11) (pred_8 ?v7) (pred_9 ?v4 ?v11))
:effect (and (pred_8 ?v4) (pred_9 ?v7 ?v11)
        (not (pred_8 ?v7)) (not (pred_9 ?v4 ?v11))))

(:action op_4
:parameters (?v11 ?v6)
:precondition (and (pred_3 ?v11) (pred_2 ?v6) 
                  (pred_1 ?v11) (pred_8 ?v6))
:effect (and (pred_4 ) (pred_9 ?v6 ?v11) (not (pred_8 ?v6)))))


	
