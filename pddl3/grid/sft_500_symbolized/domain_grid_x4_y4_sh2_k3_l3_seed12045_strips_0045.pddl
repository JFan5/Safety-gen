(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v5)
             (pred_5 ?v9 ?v4)
             (pred_10 ?v3 ?v4)
             (pred_3 ?v2 ?v3 )
	     (pred_12 ?v3)
             (pred_8 ?v7)
             (pred_1 ?v9)
             (pred_4 ?v4)
             (pred_6 ?v3)
             (pred_2 ?v9)
             (pred_7 ?v3)
             (pred_11 ))



(:action op_2
:parameters (?v13 ?v8 ?v6 ?v10)
:precondition (and (pred_8 ?v13) (pred_8 ?v8) (pred_1 ?v6) (pred_4 ?v10)
          (pred_9 ?v13 ?v8) (pred_5 ?v6 ?v10)
                   (pred_10 ?v8 ?v10) (pred_12 ?v13) 
                   (pred_6 ?v8) (pred_2 ?v6))
:effect (and  (pred_7 ?v8) (not (pred_6 ?v8))))


(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_8 ?v13) (pred_8 ?v12)
               (pred_12 ?v13) (pred_9 ?v13 ?v12) (pred_7 ?v12))
:effect (and (pred_12 ?v12) (not (pred_12 ?v13))))

(:action op_4
:parameters (?v13 ?v6)
:precondition (and (pred_8 ?v13) (pred_1 ?v6) 
                  (pred_12 ?v13) (pred_3 ?v6 ?v13) (pred_11 ))
:effect (and (pred_2 ?v6)
   (not (pred_3 ?v6 ?v13)) (not (pred_11 ))))


(:action op_3
:parameters (?v13 ?v1 ?v11)
:precondition (and (pred_8 ?v13) (pred_1 ?v1) (pred_1 ?v11)
                  (pred_12 ?v13) (pred_2 ?v11) (pred_3 ?v1 ?v13))
:effect (and (pred_2 ?v1) (pred_3 ?v11 ?v13)
        (not (pred_2 ?v11)) (not (pred_3 ?v1 ?v13))))

(:action op_1
:parameters (?v13 ?v6)
:precondition (and (pred_8 ?v13) (pred_1 ?v6) 
                  (pred_12 ?v13) (pred_2 ?v6))
:effect (and (pred_11 ) (pred_3 ?v6 ?v13) (not (pred_2 ?v6)))))


	
