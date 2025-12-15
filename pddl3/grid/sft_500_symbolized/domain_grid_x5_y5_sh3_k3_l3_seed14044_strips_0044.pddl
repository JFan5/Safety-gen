(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v3)
             (pred_11 ?v8 ?v11)
             (pred_4 ?v12 ?v11)
             (pred_5 ?v2 ?v12 )
	     (pred_3 ?v12)
             (pred_2 ?v7)
             (pred_8 ?v8)
             (pred_6 ?v11)
             (pred_10 ?v12)
             (pred_1 ?v8)
             (pred_12 ?v12)
             (pred_7 ))



(:action op_1
:parameters (?v13 ?v4 ?v10 ?v5)
:precondition (and (pred_2 ?v13) (pred_2 ?v4) (pred_8 ?v10) (pred_6 ?v5)
          (pred_9 ?v13 ?v4) (pred_11 ?v10 ?v5)
                   (pred_4 ?v4 ?v5) (pred_3 ?v13) 
                   (pred_10 ?v4) (pred_1 ?v10))
:effect (and  (pred_12 ?v4) (not (pred_10 ?v4))))


(:action op_4
:parameters (?v13 ?v1)
:precondition (and (pred_2 ?v13) (pred_2 ?v1)
               (pred_3 ?v13) (pred_9 ?v13 ?v1) (pred_12 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v13))))

(:action op_3
:parameters (?v13 ?v10)
:precondition (and (pred_2 ?v13) (pred_8 ?v10) 
                  (pred_3 ?v13) (pred_5 ?v10 ?v13) (pred_7 ))
:effect (and (pred_1 ?v10)
   (not (pred_5 ?v10 ?v13)) (not (pred_7 ))))


(:action op_2
:parameters (?v13 ?v9 ?v6)
:precondition (and (pred_2 ?v13) (pred_8 ?v9) (pred_8 ?v6)
                  (pred_3 ?v13) (pred_1 ?v6) (pred_5 ?v9 ?v13))
:effect (and (pred_1 ?v9) (pred_5 ?v6 ?v13)
        (not (pred_1 ?v6)) (not (pred_5 ?v9 ?v13))))

(:action op_5
:parameters (?v13 ?v10)
:precondition (and (pred_2 ?v13) (pred_8 ?v10) 
                  (pred_3 ?v13) (pred_1 ?v10))
:effect (and (pred_7 ) (pred_5 ?v10 ?v13) (not (pred_1 ?v10)))))


	
