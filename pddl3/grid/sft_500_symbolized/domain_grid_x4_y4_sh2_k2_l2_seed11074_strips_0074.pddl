(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v9 ?v11)
             (pred_5 ?v4 ?v5)
             (pred_1 ?v9 ?v5)
             (pred_10 ?v2 ?v9 )
	     (pred_7 ?v9)
             (pred_9 ?v8)
             (pred_8 ?v4)
             (pred_4 ?v5)
             (pred_6 ?v9)
             (pred_11 ?v4)
             (pred_12 ?v9)
             (pred_2 ))



(:action op_5
:parameters (?v13 ?v7 ?v3 ?v1)
:precondition (and (pred_9 ?v13) (pred_9 ?v7) (pred_8 ?v3) (pred_4 ?v1)
          (pred_3 ?v13 ?v7) (pred_5 ?v3 ?v1)
                   (pred_1 ?v7 ?v1) (pred_7 ?v13) 
                   (pred_6 ?v7) (pred_11 ?v3))
:effect (and  (pred_12 ?v7) (not (pred_6 ?v7))))


(:action op_4
:parameters (?v13 ?v10)
:precondition (and (pred_9 ?v13) (pred_9 ?v10)
               (pred_7 ?v13) (pred_3 ?v13 ?v10) (pred_12 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v13))))

(:action op_3
:parameters (?v13 ?v3)
:precondition (and (pred_9 ?v13) (pred_8 ?v3) 
                  (pred_7 ?v13) (pred_10 ?v3 ?v13) (pred_2 ))
:effect (and (pred_11 ?v3)
   (not (pred_10 ?v3 ?v13)) (not (pred_2 ))))


(:action op_1
:parameters (?v13 ?v12 ?v6)
:precondition (and (pred_9 ?v13) (pred_8 ?v12) (pred_8 ?v6)
                  (pred_7 ?v13) (pred_11 ?v6) (pred_10 ?v12 ?v13))
:effect (and (pred_11 ?v12) (pred_10 ?v6 ?v13)
        (not (pred_11 ?v6)) (not (pred_10 ?v12 ?v13))))

(:action op_2
:parameters (?v13 ?v3)
:precondition (and (pred_9 ?v13) (pred_8 ?v3) 
                  (pred_7 ?v13) (pred_11 ?v3))
:effect (and (pred_2 ) (pred_10 ?v3 ?v13) (not (pred_11 ?v3)))))


	
