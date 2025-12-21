(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v8)
             (pred_2 ?v13 ?v1)
             (pred_10 ?v2 ?v1)
             (pred_1 ?v4 ?v2 )
	     (pred_5 ?v2)
             (pred_7 ?v12)
             (pred_4 ?v13)
             (pred_3 ?v1)
             (pred_11 ?v2)
             (pred_9 ?v13)
             (pred_8 ?v2)
             (pred_6 ))



(:action op_3
:parameters (?v9 ?v3 ?v11 ?v10)
:precondition (and (pred_7 ?v9) (pred_7 ?v3) (pred_4 ?v11) (pred_3 ?v10)
          (pred_12 ?v9 ?v3) (pred_2 ?v11 ?v10)
                   (pred_10 ?v3 ?v10) (pred_5 ?v9) 
                   (pred_11 ?v3) (pred_9 ?v11))
:effect (and  (pred_8 ?v3) (not (pred_11 ?v3))))


(:action op_5
:parameters (?v9 ?v7)
:precondition (and (pred_7 ?v9) (pred_7 ?v7)
               (pred_5 ?v9) (pred_12 ?v9 ?v7) (pred_8 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v9))))

(:action op_1
:parameters (?v9 ?v11)
:precondition (and (pred_7 ?v9) (pred_4 ?v11) 
                  (pred_5 ?v9) (pred_1 ?v11 ?v9) (pred_6 ))
:effect (and (pred_9 ?v11)
   (not (pred_1 ?v11 ?v9)) (not (pred_6 ))))


(:action op_2
:parameters (?v9 ?v6 ?v5)
:precondition (and (pred_7 ?v9) (pred_4 ?v6) (pred_4 ?v5)
                  (pred_5 ?v9) (pred_9 ?v5) (pred_1 ?v6 ?v9))
:effect (and (pred_9 ?v6) (pred_1 ?v5 ?v9)
        (not (pred_9 ?v5)) (not (pred_1 ?v6 ?v9))))

(:action op_4
:parameters (?v9 ?v11)
:precondition (and (pred_7 ?v9) (pred_4 ?v11) 
                  (pred_5 ?v9) (pred_9 ?v11))
:effect (and (pred_6 ) (pred_1 ?v11 ?v9) (not (pred_9 ?v11)))))


	
