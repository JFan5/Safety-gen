(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v13 ?v8)
             (pred_4 ?v3 ?v1)
             (pred_11 ?v13 ?v1)
             (pred_2 ?v10 ?v13 )
	     (pred_9 ?v13)
             (pred_1 ?v4)
             (pred_5 ?v3)
             (pred_6 ?v1)
             (pred_12 ?v13)
             (pred_8 ?v3)
             (pred_3 ?v13)
             (pred_10 ))



(:action op_3
:parameters (?v11 ?v2 ?v6 ?v9)
:precondition (and (pred_1 ?v11) (pred_1 ?v2) (pred_5 ?v6) (pred_6 ?v9)
          (pred_7 ?v11 ?v2) (pred_4 ?v6 ?v9)
                   (pred_11 ?v2 ?v9) (pred_9 ?v11) 
                   (pred_12 ?v2) (pred_8 ?v6))
:effect (and  (pred_3 ?v2) (not (pred_12 ?v2))))


(:action op_5
:parameters (?v11 ?v7)
:precondition (and (pred_1 ?v11) (pred_1 ?v7)
               (pred_9 ?v11) (pred_7 ?v11 ?v7) (pred_3 ?v7))
:effect (and (pred_9 ?v7) (not (pred_9 ?v11))))

(:action op_1
:parameters (?v11 ?v6)
:precondition (and (pred_1 ?v11) (pred_5 ?v6) 
                  (pred_9 ?v11) (pred_2 ?v6 ?v11) (pred_10 ))
:effect (and (pred_8 ?v6)
   (not (pred_2 ?v6 ?v11)) (not (pred_10 ))))


(:action op_4
:parameters (?v11 ?v12 ?v5)
:precondition (and (pred_1 ?v11) (pred_5 ?v12) (pred_5 ?v5)
                  (pred_9 ?v11) (pred_8 ?v5) (pred_2 ?v12 ?v11))
:effect (and (pred_8 ?v12) (pred_2 ?v5 ?v11)
        (not (pred_8 ?v5)) (not (pred_2 ?v12 ?v11))))

(:action op_2
:parameters (?v11 ?v6)
:precondition (and (pred_1 ?v11) (pred_5 ?v6) 
                  (pred_9 ?v11) (pred_8 ?v6))
:effect (and (pred_10 ) (pred_2 ?v6 ?v11) (not (pred_8 ?v6)))))


	
