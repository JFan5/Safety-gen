(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v11 ?v1)
             (pred_6 ?v9 ?v7)
             (pred_4 ?v11 ?v7)
             (pred_1 ?v5 ?v11 )
	     (pred_5 ?v11)
             (pred_3 ?v4)
             (pred_12 ?v9)
             (pred_7 ?v7)
             (pred_11 ?v11)
             (pred_10 ?v9)
             (pred_9 ?v11)
             (pred_8 ))



(:action op_3
:parameters (?v10 ?v13 ?v12 ?v8)
:precondition (and (pred_3 ?v10) (pred_3 ?v13) (pred_12 ?v12) (pred_7 ?v8)
          (pred_2 ?v10 ?v13) (pred_6 ?v12 ?v8)
                   (pred_4 ?v13 ?v8) (pred_5 ?v10) 
                   (pred_11 ?v13) (pred_10 ?v12))
:effect (and  (pred_9 ?v13) (not (pred_11 ?v13))))


(:action op_1
:parameters (?v10 ?v2)
:precondition (and (pred_3 ?v10) (pred_3 ?v2)
               (pred_5 ?v10) (pred_2 ?v10 ?v2) (pred_9 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v10))))

(:action op_2
:parameters (?v10 ?v12)
:precondition (and (pred_3 ?v10) (pred_12 ?v12) 
                  (pred_5 ?v10) (pred_1 ?v12 ?v10) (pred_8 ))
:effect (and (pred_10 ?v12)
   (not (pred_1 ?v12 ?v10)) (not (pred_8 ))))


(:action op_5
:parameters (?v10 ?v3 ?v6)
:precondition (and (pred_3 ?v10) (pred_12 ?v3) (pred_12 ?v6)
                  (pred_5 ?v10) (pred_10 ?v6) (pred_1 ?v3 ?v10))
:effect (and (pred_10 ?v3) (pred_1 ?v6 ?v10)
        (not (pred_10 ?v6)) (not (pred_1 ?v3 ?v10))))

(:action op_4
:parameters (?v10 ?v12)
:precondition (and (pred_3 ?v10) (pred_12 ?v12) 
                  (pred_5 ?v10) (pred_10 ?v12))
:effect (and (pred_8 ) (pred_1 ?v12 ?v10) (not (pred_10 ?v12)))))


	
