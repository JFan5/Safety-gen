(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v1 ?v12)
             (pred_1 ?v6 ?v8)
             (pred_10 ?v1 ?v8)
             (pred_2 ?v9 ?v1 )
	     (pred_8 ?v1)
             (pred_4 ?v11)
             (pred_5 ?v6)
             (pred_9 ?v8)
             (pred_3 ?v1)
             (pred_6 ?v6)
             (pred_11 ?v1)
             (pred_12 ))



(:action op_4
:parameters (?v13 ?v4 ?v3 ?v5)
:precondition (and (pred_4 ?v13) (pred_4 ?v4) (pred_5 ?v3) (pred_9 ?v5)
          (pred_7 ?v13 ?v4) (pred_1 ?v3 ?v5)
                   (pred_10 ?v4 ?v5) (pred_8 ?v13) 
                   (pred_3 ?v4) (pred_6 ?v3))
:effect (and  (pred_11 ?v4) (not (pred_3 ?v4))))


(:action op_3
:parameters (?v13 ?v10)
:precondition (and (pred_4 ?v13) (pred_4 ?v10)
               (pred_8 ?v13) (pred_7 ?v13 ?v10) (pred_11 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v13))))

(:action op_2
:parameters (?v13 ?v3)
:precondition (and (pred_4 ?v13) (pred_5 ?v3) 
                  (pred_8 ?v13) (pred_2 ?v3 ?v13) (pred_12 ))
:effect (and (pred_6 ?v3)
   (not (pred_2 ?v3 ?v13)) (not (pred_12 ))))


(:action op_5
:parameters (?v13 ?v2 ?v7)
:precondition (and (pred_4 ?v13) (pred_5 ?v2) (pred_5 ?v7)
                  (pred_8 ?v13) (pred_6 ?v7) (pred_2 ?v2 ?v13))
:effect (and (pred_6 ?v2) (pred_2 ?v7 ?v13)
        (not (pred_6 ?v7)) (not (pred_2 ?v2 ?v13))))

(:action op_1
:parameters (?v13 ?v3)
:precondition (and (pred_4 ?v13) (pred_5 ?v3) 
                  (pred_8 ?v13) (pred_6 ?v3))
:effect (and (pred_12 ) (pred_2 ?v3 ?v13) (not (pred_6 ?v3)))))


	
