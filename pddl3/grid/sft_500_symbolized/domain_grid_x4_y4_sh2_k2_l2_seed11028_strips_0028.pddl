(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v12 ?v4)
             (pred_11 ?v8 ?v13)
             (pred_7 ?v12 ?v13)
             (pred_10 ?v10 ?v12 )
	     (pred_8 ?v12)
             (pred_9 ?v2)
             (pred_3 ?v8)
             (pred_2 ?v13)
             (pred_4 ?v12)
             (pred_1 ?v8)
             (pred_12 ?v12)
             (pred_5 ))



(:action op_1
:parameters (?v9 ?v1 ?v11 ?v3)
:precondition (and (pred_9 ?v9) (pred_9 ?v1) (pred_3 ?v11) (pred_2 ?v3)
          (pred_6 ?v9 ?v1) (pred_11 ?v11 ?v3)
                   (pred_7 ?v1 ?v3) (pred_8 ?v9) 
                   (pred_4 ?v1) (pred_1 ?v11))
:effect (and  (pred_12 ?v1) (not (pred_4 ?v1))))


(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_9 ?v9) (pred_9 ?v7)
               (pred_8 ?v9) (pred_6 ?v9 ?v7) (pred_12 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v9))))

(:action op_5
:parameters (?v9 ?v11)
:precondition (and (pred_9 ?v9) (pred_3 ?v11) 
                  (pred_8 ?v9) (pred_10 ?v11 ?v9) (pred_5 ))
:effect (and (pred_1 ?v11)
   (not (pred_10 ?v11 ?v9)) (not (pred_5 ))))


(:action op_4
:parameters (?v9 ?v6 ?v5)
:precondition (and (pred_9 ?v9) (pred_3 ?v6) (pred_3 ?v5)
                  (pred_8 ?v9) (pred_1 ?v5) (pred_10 ?v6 ?v9))
:effect (and (pred_1 ?v6) (pred_10 ?v5 ?v9)
        (not (pred_1 ?v5)) (not (pred_10 ?v6 ?v9))))

(:action op_2
:parameters (?v9 ?v11)
:precondition (and (pred_9 ?v9) (pred_3 ?v11) 
                  (pred_8 ?v9) (pred_1 ?v11))
:effect (and (pred_5 ) (pred_10 ?v11 ?v9) (not (pred_1 ?v11)))))


	
