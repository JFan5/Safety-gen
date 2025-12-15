(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v8 ?v1)
             (pred_6 ?v9 ?v10)
             (pred_1 ?v8 ?v10)
             (pred_2 ?v6 ?v8 )
	     (pred_3 ?v8)
             (pred_5 ?v5)
             (pred_4 ?v9)
             (pred_8 ?v10)
             (pred_11 ?v8)
             (pred_7 ?v9)
             (pred_12 ?v8)
             (pred_9 ))



(:action op_1
:parameters (?v13 ?v4 ?v12 ?v11)
:precondition (and (pred_5 ?v13) (pred_5 ?v4) (pred_4 ?v12) (pred_8 ?v11)
          (pred_10 ?v13 ?v4) (pred_6 ?v12 ?v11)
                   (pred_1 ?v4 ?v11) (pred_3 ?v13) 
                   (pred_11 ?v4) (pred_7 ?v12))
:effect (and  (pred_12 ?v4) (not (pred_11 ?v4))))


(:action op_3
:parameters (?v13 ?v2)
:precondition (and (pred_5 ?v13) (pred_5 ?v2)
               (pred_3 ?v13) (pred_10 ?v13 ?v2) (pred_12 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v13))))

(:action op_2
:parameters (?v13 ?v12)
:precondition (and (pred_5 ?v13) (pred_4 ?v12) 
                  (pred_3 ?v13) (pred_2 ?v12 ?v13) (pred_9 ))
:effect (and (pred_7 ?v12)
   (not (pred_2 ?v12 ?v13)) (not (pred_9 ))))


(:action op_4
:parameters (?v13 ?v7 ?v3)
:precondition (and (pred_5 ?v13) (pred_4 ?v7) (pred_4 ?v3)
                  (pred_3 ?v13) (pred_7 ?v3) (pred_2 ?v7 ?v13))
:effect (and (pred_7 ?v7) (pred_2 ?v3 ?v13)
        (not (pred_7 ?v3)) (not (pred_2 ?v7 ?v13))))

(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_5 ?v13) (pred_4 ?v12) 
                  (pred_3 ?v13) (pred_7 ?v12))
:effect (and (pred_9 ) (pred_2 ?v12 ?v13) (not (pred_7 ?v12)))))


	
