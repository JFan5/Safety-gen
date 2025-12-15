(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v7 ?v5)
             (pred_7 ?v3 ?v8)
             (pred_4 ?v7 ?v8)
             (pred_6 ?v2 ?v7 )
	     (pred_10 ?v7)
             (pred_12 ?v4)
             (pred_8 ?v3)
             (pred_5 ?v8)
             (pred_2 ?v7)
             (pred_9 ?v3)
             (pred_1 ?v7)
             (pred_3 ))



(:action op_2
:parameters (?v10 ?v13 ?v12 ?v1)
:precondition (and (pred_12 ?v10) (pred_12 ?v13) (pred_8 ?v12) (pred_5 ?v1)
          (pred_11 ?v10 ?v13) (pred_7 ?v12 ?v1)
                   (pred_4 ?v13 ?v1) (pred_10 ?v10) 
                   (pred_2 ?v13) (pred_9 ?v12))
:effect (and  (pred_1 ?v13) (not (pred_2 ?v13))))


(:action op_1
:parameters (?v10 ?v9)
:precondition (and (pred_12 ?v10) (pred_12 ?v9)
               (pred_10 ?v10) (pred_11 ?v10 ?v9) (pred_1 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v10))))

(:action op_3
:parameters (?v10 ?v12)
:precondition (and (pred_12 ?v10) (pred_8 ?v12) 
                  (pred_10 ?v10) (pred_6 ?v12 ?v10) (pred_3 ))
:effect (and (pred_9 ?v12)
   (not (pred_6 ?v12 ?v10)) (not (pred_3 ))))


(:action op_4
:parameters (?v10 ?v11 ?v6)
:precondition (and (pred_12 ?v10) (pred_8 ?v11) (pred_8 ?v6)
                  (pred_10 ?v10) (pred_9 ?v6) (pred_6 ?v11 ?v10))
:effect (and (pred_9 ?v11) (pred_6 ?v6 ?v10)
        (not (pred_9 ?v6)) (not (pred_6 ?v11 ?v10))))

(:action op_5
:parameters (?v10 ?v12)
:precondition (and (pred_12 ?v10) (pred_8 ?v12) 
                  (pred_10 ?v10) (pred_9 ?v12))
:effect (and (pred_3 ) (pred_6 ?v12 ?v10) (not (pred_9 ?v12)))))


	
