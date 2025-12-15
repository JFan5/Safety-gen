(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v1)
             (pred_12 ?v11 ?v6)
             (pred_2 ?v12 ?v6)
             (pred_6 ?v3 ?v12 )
	     (pred_5 ?v12)
             (pred_4 ?v7)
             (pred_7 ?v11)
             (pred_11 ?v6)
             (pred_3 ?v12)
             (pred_8 ?v11)
             (pred_9 ?v12)
             (pred_10 ))



(:action op_5
:parameters (?v10 ?v2 ?v5 ?v4)
:precondition (and (pred_4 ?v10) (pred_4 ?v2) (pred_7 ?v5) (pred_11 ?v4)
          (pred_1 ?v10 ?v2) (pred_12 ?v5 ?v4)
                   (pred_2 ?v2 ?v4) (pred_5 ?v10) 
                   (pred_3 ?v2) (pred_8 ?v5))
:effect (and  (pred_9 ?v2) (not (pred_3 ?v2))))


(:action op_2
:parameters (?v10 ?v9)
:precondition (and (pred_4 ?v10) (pred_4 ?v9)
               (pred_5 ?v10) (pred_1 ?v10 ?v9) (pred_9 ?v9))
:effect (and (pred_5 ?v9) (not (pred_5 ?v10))))

(:action op_3
:parameters (?v10 ?v5)
:precondition (and (pred_4 ?v10) (pred_7 ?v5) 
                  (pred_5 ?v10) (pred_6 ?v5 ?v10) (pred_10 ))
:effect (and (pred_8 ?v5)
   (not (pred_6 ?v5 ?v10)) (not (pred_10 ))))


(:action op_1
:parameters (?v10 ?v8 ?v13)
:precondition (and (pred_4 ?v10) (pred_7 ?v8) (pred_7 ?v13)
                  (pred_5 ?v10) (pred_8 ?v13) (pred_6 ?v8 ?v10))
:effect (and (pred_8 ?v8) (pred_6 ?v13 ?v10)
        (not (pred_8 ?v13)) (not (pred_6 ?v8 ?v10))))

(:action op_4
:parameters (?v10 ?v5)
:precondition (and (pred_4 ?v10) (pred_7 ?v5) 
                  (pred_5 ?v10) (pred_8 ?v5))
:effect (and (pred_10 ) (pred_6 ?v5 ?v10) (not (pred_8 ?v5)))))


	
