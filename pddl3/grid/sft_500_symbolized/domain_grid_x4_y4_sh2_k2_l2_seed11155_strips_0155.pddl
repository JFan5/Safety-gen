(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v3 ?v2)
             (pred_7 ?v6 ?v7)
             (pred_6 ?v3 ?v7)
             (pred_1 ?v5 ?v3 )
	     (pred_10 ?v3)
             (pred_3 ?v8)
             (pred_9 ?v6)
             (pred_4 ?v7)
             (pred_2 ?v3)
             (pred_8 ?v6)
             (pred_12 ?v3)
             (pred_11 ))



(:action op_2
:parameters (?v9 ?v12 ?v4 ?v1)
:precondition (and (pred_3 ?v9) (pred_3 ?v12) (pred_9 ?v4) (pred_4 ?v1)
          (pred_5 ?v9 ?v12) (pred_7 ?v4 ?v1)
                   (pred_6 ?v12 ?v1) (pred_10 ?v9) 
                   (pred_2 ?v12) (pred_8 ?v4))
:effect (and  (pred_12 ?v12) (not (pred_2 ?v12))))


(:action op_3
:parameters (?v9 ?v13)
:precondition (and (pred_3 ?v9) (pred_3 ?v13)
               (pred_10 ?v9) (pred_5 ?v9 ?v13) (pred_12 ?v13))
:effect (and (pred_10 ?v13) (not (pred_10 ?v9))))

(:action op_1
:parameters (?v9 ?v4)
:precondition (and (pred_3 ?v9) (pred_9 ?v4) 
                  (pred_10 ?v9) (pred_1 ?v4 ?v9) (pred_11 ))
:effect (and (pred_8 ?v4)
   (not (pred_1 ?v4 ?v9)) (not (pred_11 ))))


(:action op_4
:parameters (?v9 ?v11 ?v10)
:precondition (and (pred_3 ?v9) (pred_9 ?v11) (pred_9 ?v10)
                  (pred_10 ?v9) (pred_8 ?v10) (pred_1 ?v11 ?v9))
:effect (and (pred_8 ?v11) (pred_1 ?v10 ?v9)
        (not (pred_8 ?v10)) (not (pred_1 ?v11 ?v9))))

(:action op_5
:parameters (?v9 ?v4)
:precondition (and (pred_3 ?v9) (pred_9 ?v4) 
                  (pred_10 ?v9) (pred_8 ?v4))
:effect (and (pred_11 ) (pred_1 ?v4 ?v9) (not (pred_8 ?v4)))))


	
