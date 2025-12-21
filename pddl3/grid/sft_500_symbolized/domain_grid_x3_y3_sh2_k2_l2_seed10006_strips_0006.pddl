(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v3 ?v1)
             (pred_6 ?v6 ?v11)
             (pred_5 ?v3 ?v11)
             (pred_4 ?v5 ?v3 )
	     (pred_11 ?v3)
             (pred_8 ?v7)
             (pred_12 ?v6)
             (pred_9 ?v11)
             (pred_3 ?v3)
             (pred_7 ?v6)
             (pred_10 ?v3)
             (pred_2 ))



(:action op_4
:parameters (?v10 ?v12 ?v4 ?v9)
:precondition (and (pred_8 ?v10) (pred_8 ?v12) (pred_12 ?v4) (pred_9 ?v9)
          (pred_1 ?v10 ?v12) (pred_6 ?v4 ?v9)
                   (pred_5 ?v12 ?v9) (pred_11 ?v10) 
                   (pred_3 ?v12) (pred_7 ?v4))
:effect (and  (pred_10 ?v12) (not (pred_3 ?v12))))


(:action op_5
:parameters (?v10 ?v2)
:precondition (and (pred_8 ?v10) (pred_8 ?v2)
               (pred_11 ?v10) (pred_1 ?v10 ?v2) (pred_10 ?v2))
:effect (and (pred_11 ?v2) (not (pred_11 ?v10))))

(:action op_1
:parameters (?v10 ?v4)
:precondition (and (pred_8 ?v10) (pred_12 ?v4) 
                  (pred_11 ?v10) (pred_4 ?v4 ?v10) (pred_2 ))
:effect (and (pred_7 ?v4)
   (not (pred_4 ?v4 ?v10)) (not (pred_2 ))))


(:action op_3
:parameters (?v10 ?v13 ?v8)
:precondition (and (pred_8 ?v10) (pred_12 ?v13) (pred_12 ?v8)
                  (pred_11 ?v10) (pred_7 ?v8) (pred_4 ?v13 ?v10))
:effect (and (pred_7 ?v13) (pred_4 ?v8 ?v10)
        (not (pred_7 ?v8)) (not (pred_4 ?v13 ?v10))))

(:action op_2
:parameters (?v10 ?v4)
:precondition (and (pred_8 ?v10) (pred_12 ?v4) 
                  (pred_11 ?v10) (pred_7 ?v4))
:effect (and (pred_2 ) (pred_4 ?v4 ?v10) (not (pred_7 ?v4)))))


	
