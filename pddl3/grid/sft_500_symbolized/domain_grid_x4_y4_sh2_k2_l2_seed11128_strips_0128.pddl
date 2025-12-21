(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v10 ?v4)
             (pred_10 ?v6 ?v7)
             (pred_7 ?v10 ?v7)
             (pred_2 ?v9 ?v10 )
	     (pred_1 ?v10)
             (pred_12 ?v1)
             (pred_4 ?v6)
             (pred_6 ?v7)
             (pred_9 ?v10)
             (pred_5 ?v6)
             (pred_3 ?v10)
             (pred_8 ))



(:action op_3
:parameters (?v13 ?v8 ?v3 ?v2)
:precondition (and (pred_12 ?v13) (pred_12 ?v8) (pred_4 ?v3) (pred_6 ?v2)
          (pred_11 ?v13 ?v8) (pred_10 ?v3 ?v2)
                   (pred_7 ?v8 ?v2) (pred_1 ?v13) 
                   (pred_9 ?v8) (pred_5 ?v3))
:effect (and  (pred_3 ?v8) (not (pred_9 ?v8))))


(:action op_4
:parameters (?v13 ?v12)
:precondition (and (pred_12 ?v13) (pred_12 ?v12)
               (pred_1 ?v13) (pred_11 ?v13 ?v12) (pred_3 ?v12))
:effect (and (pred_1 ?v12) (not (pred_1 ?v13))))

(:action op_2
:parameters (?v13 ?v3)
:precondition (and (pred_12 ?v13) (pred_4 ?v3) 
                  (pred_1 ?v13) (pred_2 ?v3 ?v13) (pred_8 ))
:effect (and (pred_5 ?v3)
   (not (pred_2 ?v3 ?v13)) (not (pred_8 ))))


(:action op_5
:parameters (?v13 ?v5 ?v11)
:precondition (and (pred_12 ?v13) (pred_4 ?v5) (pred_4 ?v11)
                  (pred_1 ?v13) (pred_5 ?v11) (pred_2 ?v5 ?v13))
:effect (and (pred_5 ?v5) (pred_2 ?v11 ?v13)
        (not (pred_5 ?v11)) (not (pred_2 ?v5 ?v13))))

(:action op_1
:parameters (?v13 ?v3)
:precondition (and (pred_12 ?v13) (pred_4 ?v3) 
                  (pred_1 ?v13) (pred_5 ?v3))
:effect (and (pred_8 ) (pred_2 ?v3 ?v13) (not (pred_5 ?v3)))))


	
