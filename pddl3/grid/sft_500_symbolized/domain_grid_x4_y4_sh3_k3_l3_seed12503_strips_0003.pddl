(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v2 ?v4)
             (pred_7 ?v3 ?v11)
             (pred_10 ?v2 ?v11)
             (pred_11 ?v7 ?v2 )
	     (pred_9 ?v2)
             (pred_1 ?v5)
             (pred_6 ?v3)
             (pred_4 ?v11)
             (pred_5 ?v2)
             (pred_3 ?v3)
             (pred_12 ?v2)
             (pred_8 ))



(:action op_1
:parameters (?v13 ?v10 ?v12 ?v6)
:precondition (and (pred_1 ?v13) (pred_1 ?v10) (pred_6 ?v12) (pred_4 ?v6)
          (pred_2 ?v13 ?v10) (pred_7 ?v12 ?v6)
                   (pred_10 ?v10 ?v6) (pred_9 ?v13) 
                   (pred_5 ?v10) (pred_3 ?v12))
:effect (and  (pred_12 ?v10) (not (pred_5 ?v10))))


(:action op_4
:parameters (?v13 ?v9)
:precondition (and (pred_1 ?v13) (pred_1 ?v9)
               (pred_9 ?v13) (pred_2 ?v13 ?v9) (pred_12 ?v9))
:effect (and (pred_9 ?v9) (not (pred_9 ?v13))))

(:action op_2
:parameters (?v13 ?v12)
:precondition (and (pred_1 ?v13) (pred_6 ?v12) 
                  (pred_9 ?v13) (pred_11 ?v12 ?v13) (pred_8 ))
:effect (and (pred_3 ?v12)
   (not (pred_11 ?v12 ?v13)) (not (pred_8 ))))


(:action op_3
:parameters (?v13 ?v1 ?v8)
:precondition (and (pred_1 ?v13) (pred_6 ?v1) (pred_6 ?v8)
                  (pred_9 ?v13) (pred_3 ?v8) (pred_11 ?v1 ?v13))
:effect (and (pred_3 ?v1) (pred_11 ?v8 ?v13)
        (not (pred_3 ?v8)) (not (pred_11 ?v1 ?v13))))

(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_1 ?v13) (pred_6 ?v12) 
                  (pred_9 ?v13) (pred_3 ?v12))
:effect (and (pred_8 ) (pred_11 ?v12 ?v13) (not (pred_3 ?v12)))))


	
