(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v6 ?v12)
             (pred_10 ?v1 ?v4)
             (pred_1 ?v6 ?v4)
             (pred_8 ?v3 ?v6 )
	     (pred_2 ?v6)
             (pred_11 ?v5)
             (pred_9 ?v1)
             (pred_12 ?v4)
             (pred_4 ?v6)
             (pred_7 ?v1)
             (pred_6 ?v6)
             (pred_3 ))



(:action op_4
:parameters (?v9 ?v10 ?v8 ?v2)
:precondition (and (pred_11 ?v9) (pred_11 ?v10) (pred_9 ?v8) (pred_12 ?v2)
          (pred_5 ?v9 ?v10) (pred_10 ?v8 ?v2)
                   (pred_1 ?v10 ?v2) (pred_2 ?v9) 
                   (pred_4 ?v10) (pred_7 ?v8))
:effect (and  (pred_6 ?v10) (not (pred_4 ?v10))))


(:action op_1
:parameters (?v9 ?v13)
:precondition (and (pred_11 ?v9) (pred_11 ?v13)
               (pred_2 ?v9) (pred_5 ?v9 ?v13) (pred_6 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v9))))

(:action op_2
:parameters (?v9 ?v8)
:precondition (and (pred_11 ?v9) (pred_9 ?v8) 
                  (pred_2 ?v9) (pred_8 ?v8 ?v9) (pred_3 ))
:effect (and (pred_7 ?v8)
   (not (pred_8 ?v8 ?v9)) (not (pred_3 ))))


(:action op_3
:parameters (?v9 ?v7 ?v11)
:precondition (and (pred_11 ?v9) (pred_9 ?v7) (pred_9 ?v11)
                  (pred_2 ?v9) (pred_7 ?v11) (pred_8 ?v7 ?v9))
:effect (and (pred_7 ?v7) (pred_8 ?v11 ?v9)
        (not (pred_7 ?v11)) (not (pred_8 ?v7 ?v9))))

(:action op_5
:parameters (?v9 ?v8)
:precondition (and (pred_11 ?v9) (pred_9 ?v8) 
                  (pred_2 ?v9) (pred_7 ?v8))
:effect (and (pred_3 ) (pred_8 ?v8 ?v9) (not (pred_7 ?v8)))))


	
