(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v4)
             (pred_8 ?v11 ?v9)
             (pred_1 ?v8 ?v9)
             (pred_9 ?v2 ?v8 )
	     (pred_5 ?v8)
             (pred_7 ?v10)
             (pred_12 ?v11)
             (pred_3 ?v9)
             (pred_10 ?v8)
             (pred_11 ?v11)
             (pred_2 ?v8)
             (pred_4 ))



(:action op_2
:parameters (?v13 ?v7 ?v1 ?v6)
:precondition (and (pred_7 ?v13) (pred_7 ?v7) (pred_12 ?v1) (pred_3 ?v6)
          (pred_6 ?v13 ?v7) (pred_8 ?v1 ?v6)
                   (pred_1 ?v7 ?v6) (pred_5 ?v13) 
                   (pred_10 ?v7) (pred_11 ?v1))
:effect (and  (pred_2 ?v7) (not (pred_10 ?v7))))


(:action op_1
:parameters (?v13 ?v3)
:precondition (and (pred_7 ?v13) (pred_7 ?v3)
               (pred_5 ?v13) (pred_6 ?v13 ?v3) (pred_2 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v13))))

(:action op_3
:parameters (?v13 ?v1)
:precondition (and (pred_7 ?v13) (pred_12 ?v1) 
                  (pred_5 ?v13) (pred_9 ?v1 ?v13) (pred_4 ))
:effect (and (pred_11 ?v1)
   (not (pred_9 ?v1 ?v13)) (not (pred_4 ))))


(:action op_4
:parameters (?v13 ?v5 ?v12)
:precondition (and (pred_7 ?v13) (pred_12 ?v5) (pred_12 ?v12)
                  (pred_5 ?v13) (pred_11 ?v12) (pred_9 ?v5 ?v13))
:effect (and (pred_11 ?v5) (pred_9 ?v12 ?v13)
        (not (pred_11 ?v12)) (not (pred_9 ?v5 ?v13))))

(:action op_5
:parameters (?v13 ?v1)
:precondition (and (pred_7 ?v13) (pred_12 ?v1) 
                  (pred_5 ?v13) (pred_11 ?v1))
:effect (and (pred_4 ) (pred_9 ?v1 ?v13) (not (pred_11 ?v1)))))


	
