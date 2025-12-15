(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v12 ?v7)
             (pred_9 ?v3 ?v2)
             (pred_3 ?v12 ?v2)
             (pred_10 ?v1 ?v12 )
	     (pred_4 ?v12)
             (pred_7 ?v5)
             (pred_1 ?v3)
             (pred_12 ?v2)
             (pred_5 ?v12)
             (pred_8 ?v3)
             (pred_11 ?v12)
             (pred_6 ))



(:action op_3
:parameters (?v10 ?v8 ?v13 ?v11)
:precondition (and (pred_7 ?v10) (pred_7 ?v8) (pred_1 ?v13) (pred_12 ?v11)
          (pred_2 ?v10 ?v8) (pred_9 ?v13 ?v11)
                   (pred_3 ?v8 ?v11) (pred_4 ?v10) 
                   (pred_5 ?v8) (pred_8 ?v13))
:effect (and  (pred_11 ?v8) (not (pred_5 ?v8))))


(:action op_1
:parameters (?v10 ?v4)
:precondition (and (pred_7 ?v10) (pred_7 ?v4)
               (pred_4 ?v10) (pred_2 ?v10 ?v4) (pred_11 ?v4))
:effect (and (pred_4 ?v4) (not (pred_4 ?v10))))

(:action op_4
:parameters (?v10 ?v13)
:precondition (and (pred_7 ?v10) (pred_1 ?v13) 
                  (pred_4 ?v10) (pred_10 ?v13 ?v10) (pred_6 ))
:effect (and (pred_8 ?v13)
   (not (pred_10 ?v13 ?v10)) (not (pred_6 ))))


(:action op_5
:parameters (?v10 ?v9 ?v6)
:precondition (and (pred_7 ?v10) (pred_1 ?v9) (pred_1 ?v6)
                  (pred_4 ?v10) (pred_8 ?v6) (pred_10 ?v9 ?v10))
:effect (and (pred_8 ?v9) (pred_10 ?v6 ?v10)
        (not (pred_8 ?v6)) (not (pred_10 ?v9 ?v10))))

(:action op_2
:parameters (?v10 ?v13)
:precondition (and (pred_7 ?v10) (pred_1 ?v13) 
                  (pred_4 ?v10) (pred_8 ?v13))
:effect (and (pred_6 ) (pred_10 ?v13 ?v10) (not (pred_8 ?v13)))))


	
