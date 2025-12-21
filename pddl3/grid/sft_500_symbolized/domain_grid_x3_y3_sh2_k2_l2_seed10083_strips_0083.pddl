(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v1 ?v4)
             (pred_2 ?v7 ?v6)
             (pred_9 ?v1 ?v6)
             (pred_6 ?v3 ?v1 )
	     (pred_7 ?v1)
             (pred_4 ?v5)
             (pred_11 ?v7)
             (pred_12 ?v6)
             (pred_3 ?v1)
             (pred_1 ?v7)
             (pred_5 ?v1)
             (pred_10 ))



(:action op_4
:parameters (?v10 ?v12 ?v11 ?v2)
:precondition (and (pred_4 ?v10) (pred_4 ?v12) (pred_11 ?v11) (pred_12 ?v2)
          (pred_8 ?v10 ?v12) (pred_2 ?v11 ?v2)
                   (pred_9 ?v12 ?v2) (pred_7 ?v10) 
                   (pred_3 ?v12) (pred_1 ?v11))
:effect (and  (pred_5 ?v12) (not (pred_3 ?v12))))


(:action op_5
:parameters (?v10 ?v8)
:precondition (and (pred_4 ?v10) (pred_4 ?v8)
               (pred_7 ?v10) (pred_8 ?v10 ?v8) (pred_5 ?v8))
:effect (and (pred_7 ?v8) (not (pred_7 ?v10))))

(:action op_2
:parameters (?v10 ?v11)
:precondition (and (pred_4 ?v10) (pred_11 ?v11) 
                  (pred_7 ?v10) (pred_6 ?v11 ?v10) (pred_10 ))
:effect (and (pred_1 ?v11)
   (not (pred_6 ?v11 ?v10)) (not (pred_10 ))))


(:action op_3
:parameters (?v10 ?v9 ?v13)
:precondition (and (pred_4 ?v10) (pred_11 ?v9) (pred_11 ?v13)
                  (pred_7 ?v10) (pred_1 ?v13) (pred_6 ?v9 ?v10))
:effect (and (pred_1 ?v9) (pred_6 ?v13 ?v10)
        (not (pred_1 ?v13)) (not (pred_6 ?v9 ?v10))))

(:action op_1
:parameters (?v10 ?v11)
:precondition (and (pred_4 ?v10) (pred_11 ?v11) 
                  (pred_7 ?v10) (pred_1 ?v11))
:effect (and (pred_10 ) (pred_6 ?v11 ?v10) (not (pred_1 ?v11)))))


	
