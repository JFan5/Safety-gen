(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v1)
             (pred_12 ?v9 ?v8)
             (pred_1 ?v4 ?v8)
             (pred_9 ?v5 ?v4 )
	     (pred_3 ?v4)
             (pred_11 ?v13)
             (pred_7 ?v9)
             (pred_5 ?v8)
             (pred_4 ?v4)
             (pred_8 ?v9)
             (pred_6 ?v4)
             (pred_2 ))



(:action op_2
:parameters (?v10 ?v12 ?v11 ?v2)
:precondition (and (pred_11 ?v10) (pred_11 ?v12) (pred_7 ?v11) (pred_5 ?v2)
          (pred_10 ?v10 ?v12) (pred_12 ?v11 ?v2)
                   (pred_1 ?v12 ?v2) (pred_3 ?v10) 
                   (pred_4 ?v12) (pred_8 ?v11))
:effect (and  (pred_6 ?v12) (not (pred_4 ?v12))))


(:action op_3
:parameters (?v10 ?v3)
:precondition (and (pred_11 ?v10) (pred_11 ?v3)
               (pred_3 ?v10) (pred_10 ?v10 ?v3) (pred_6 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v10))))

(:action op_4
:parameters (?v10 ?v11)
:precondition (and (pred_11 ?v10) (pred_7 ?v11) 
                  (pred_3 ?v10) (pred_9 ?v11 ?v10) (pred_2 ))
:effect (and (pred_8 ?v11)
   (not (pred_9 ?v11 ?v10)) (not (pred_2 ))))


(:action op_5
:parameters (?v10 ?v7 ?v6)
:precondition (and (pred_11 ?v10) (pred_7 ?v7) (pred_7 ?v6)
                  (pred_3 ?v10) (pred_8 ?v6) (pred_9 ?v7 ?v10))
:effect (and (pred_8 ?v7) (pred_9 ?v6 ?v10)
        (not (pred_8 ?v6)) (not (pred_9 ?v7 ?v10))))

(:action op_1
:parameters (?v10 ?v11)
:precondition (and (pred_11 ?v10) (pred_7 ?v11) 
                  (pred_3 ?v10) (pred_8 ?v11))
:effect (and (pred_2 ) (pred_9 ?v11 ?v10) (not (pred_8 ?v11)))))


	
