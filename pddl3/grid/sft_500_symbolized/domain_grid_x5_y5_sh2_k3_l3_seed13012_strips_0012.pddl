(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v13 ?v9)
             (pred_7 ?v1 ?v7)
             (pred_6 ?v13 ?v7)
             (pred_2 ?v2 ?v13 )
	     (pred_1 ?v13)
             (pred_12 ?v10)
             (pred_10 ?v1)
             (pred_11 ?v7)
             (pred_3 ?v13)
             (pred_5 ?v1)
             (pred_9 ?v13)
             (pred_4 ))



(:action op_5
:parameters (?v11 ?v3 ?v4 ?v12)
:precondition (and (pred_12 ?v11) (pred_12 ?v3) (pred_10 ?v4) (pred_11 ?v12)
          (pred_8 ?v11 ?v3) (pred_7 ?v4 ?v12)
                   (pred_6 ?v3 ?v12) (pred_1 ?v11) 
                   (pred_3 ?v3) (pred_5 ?v4))
:effect (and  (pred_9 ?v3) (not (pred_3 ?v3))))


(:action op_1
:parameters (?v11 ?v6)
:precondition (and (pred_12 ?v11) (pred_12 ?v6)
               (pred_1 ?v11) (pred_8 ?v11 ?v6) (pred_9 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v11))))

(:action op_2
:parameters (?v11 ?v4)
:precondition (and (pred_12 ?v11) (pred_10 ?v4) 
                  (pred_1 ?v11) (pred_2 ?v4 ?v11) (pred_4 ))
:effect (and (pred_5 ?v4)
   (not (pred_2 ?v4 ?v11)) (not (pred_4 ))))


(:action op_3
:parameters (?v11 ?v8 ?v5)
:precondition (and (pred_12 ?v11) (pred_10 ?v8) (pred_10 ?v5)
                  (pred_1 ?v11) (pred_5 ?v5) (pred_2 ?v8 ?v11))
:effect (and (pred_5 ?v8) (pred_2 ?v5 ?v11)
        (not (pred_5 ?v5)) (not (pred_2 ?v8 ?v11))))

(:action op_4
:parameters (?v11 ?v4)
:precondition (and (pred_12 ?v11) (pred_10 ?v4) 
                  (pred_1 ?v11) (pred_5 ?v4))
:effect (and (pred_4 ) (pred_2 ?v4 ?v11) (not (pred_5 ?v4)))))


	
