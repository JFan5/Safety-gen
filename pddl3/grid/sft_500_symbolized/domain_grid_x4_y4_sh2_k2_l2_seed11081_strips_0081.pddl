(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v2 ?v10)
             (pred_3 ?v11 ?v1)
             (pred_11 ?v2 ?v1)
             (pred_7 ?v4 ?v2 )
	     (pred_5 ?v2)
             (pred_2 ?v9)
             (pred_12 ?v11)
             (pred_10 ?v1)
             (pred_8 ?v2)
             (pred_1 ?v11)
             (pred_4 ?v2)
             (pred_9 ))



(:action op_1
:parameters (?v13 ?v7 ?v3 ?v5)
:precondition (and (pred_2 ?v13) (pred_2 ?v7) (pred_12 ?v3) (pred_10 ?v5)
          (pred_6 ?v13 ?v7) (pred_3 ?v3 ?v5)
                   (pred_11 ?v7 ?v5) (pred_5 ?v13) 
                   (pred_8 ?v7) (pred_1 ?v3))
:effect (and  (pred_4 ?v7) (not (pred_8 ?v7))))


(:action op_4
:parameters (?v13 ?v6)
:precondition (and (pred_2 ?v13) (pred_2 ?v6)
               (pred_5 ?v13) (pred_6 ?v13 ?v6) (pred_4 ?v6))
:effect (and (pred_5 ?v6) (not (pred_5 ?v13))))

(:action op_5
:parameters (?v13 ?v3)
:precondition (and (pred_2 ?v13) (pred_12 ?v3) 
                  (pred_5 ?v13) (pred_7 ?v3 ?v13) (pred_9 ))
:effect (and (pred_1 ?v3)
   (not (pred_7 ?v3 ?v13)) (not (pred_9 ))))


(:action op_3
:parameters (?v13 ?v8 ?v12)
:precondition (and (pred_2 ?v13) (pred_12 ?v8) (pred_12 ?v12)
                  (pred_5 ?v13) (pred_1 ?v12) (pred_7 ?v8 ?v13))
:effect (and (pred_1 ?v8) (pred_7 ?v12 ?v13)
        (not (pred_1 ?v12)) (not (pred_7 ?v8 ?v13))))

(:action op_2
:parameters (?v13 ?v3)
:precondition (and (pred_2 ?v13) (pred_12 ?v3) 
                  (pred_5 ?v13) (pred_1 ?v3))
:effect (and (pred_9 ) (pred_7 ?v3 ?v13) (not (pred_1 ?v3)))))


	
