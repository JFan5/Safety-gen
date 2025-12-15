(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v12 ?v4)
             (pred_9 ?v7 ?v11)
             (pred_2 ?v12 ?v11)
             (pred_12 ?v3 ?v12 )
	     (pred_6 ?v12)
             (pred_1 ?v2)
             (pred_8 ?v7)
             (pred_10 ?v11)
             (pred_4 ?v12)
             (pred_7 ?v7)
             (pred_11 ?v12)
             (pred_3 ))



(:action op_5
:parameters (?v10 ?v9 ?v6 ?v5)
:precondition (and (pred_1 ?v10) (pred_1 ?v9) (pred_8 ?v6) (pred_10 ?v5)
          (pred_5 ?v10 ?v9) (pred_9 ?v6 ?v5)
                   (pred_2 ?v9 ?v5) (pred_6 ?v10) 
                   (pred_4 ?v9) (pred_7 ?v6))
:effect (and  (pred_11 ?v9) (not (pred_4 ?v9))))


(:action op_4
:parameters (?v10 ?v13)
:precondition (and (pred_1 ?v10) (pred_1 ?v13)
               (pred_6 ?v10) (pred_5 ?v10 ?v13) (pred_11 ?v13))
:effect (and (pred_6 ?v13) (not (pred_6 ?v10))))

(:action op_1
:parameters (?v10 ?v6)
:precondition (and (pred_1 ?v10) (pred_8 ?v6) 
                  (pred_6 ?v10) (pred_12 ?v6 ?v10) (pred_3 ))
:effect (and (pred_7 ?v6)
   (not (pred_12 ?v6 ?v10)) (not (pred_3 ))))


(:action op_3
:parameters (?v10 ?v1 ?v8)
:precondition (and (pred_1 ?v10) (pred_8 ?v1) (pred_8 ?v8)
                  (pred_6 ?v10) (pred_7 ?v8) (pred_12 ?v1 ?v10))
:effect (and (pred_7 ?v1) (pred_12 ?v8 ?v10)
        (not (pred_7 ?v8)) (not (pred_12 ?v1 ?v10))))

(:action op_2
:parameters (?v10 ?v6)
:precondition (and (pred_1 ?v10) (pred_8 ?v6) 
                  (pred_6 ?v10) (pred_7 ?v6))
:effect (and (pred_3 ) (pred_12 ?v6 ?v10) (not (pred_7 ?v6)))))


	
