(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v12 ?v2)
             (pred_6 ?v3 ?v13)
             (pred_3 ?v12 ?v13)
             (pred_8 ?v8 ?v12 )
	     (pred_4 ?v12)
             (pred_11 ?v6)
             (pred_10 ?v3)
             (pred_5 ?v13)
             (pred_9 ?v12)
             (pred_12 ?v3)
             (pred_7 ?v12)
             (pred_1 ))



(:action op_2
:parameters (?v9 ?v11 ?v7 ?v4)
:precondition (and (pred_11 ?v9) (pred_11 ?v11) (pred_10 ?v7) (pred_5 ?v4)
          (pred_2 ?v9 ?v11) (pred_6 ?v7 ?v4)
                   (pred_3 ?v11 ?v4) (pred_4 ?v9) 
                   (pred_9 ?v11) (pred_12 ?v7))
:effect (and  (pred_7 ?v11) (not (pred_9 ?v11))))


(:action op_1
:parameters (?v9 ?v10)
:precondition (and (pred_11 ?v9) (pred_11 ?v10)
               (pred_4 ?v9) (pred_2 ?v9 ?v10) (pred_7 ?v10))
:effect (and (pred_4 ?v10) (not (pred_4 ?v9))))

(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_11 ?v9) (pred_10 ?v7) 
                  (pred_4 ?v9) (pred_8 ?v7 ?v9) (pred_1 ))
:effect (and (pred_12 ?v7)
   (not (pred_8 ?v7 ?v9)) (not (pred_1 ))))


(:action op_4
:parameters (?v9 ?v5 ?v1)
:precondition (and (pred_11 ?v9) (pred_10 ?v5) (pred_10 ?v1)
                  (pred_4 ?v9) (pred_12 ?v1) (pred_8 ?v5 ?v9))
:effect (and (pred_12 ?v5) (pred_8 ?v1 ?v9)
        (not (pred_12 ?v1)) (not (pred_8 ?v5 ?v9))))

(:action op_5
:parameters (?v9 ?v7)
:precondition (and (pred_11 ?v9) (pred_10 ?v7) 
                  (pred_4 ?v9) (pred_12 ?v7))
:effect (and (pred_1 ) (pred_8 ?v7 ?v9) (not (pred_12 ?v7)))))


	
