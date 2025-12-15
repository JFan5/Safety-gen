(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v4)
             (pred_1 ?v7 ?v8)
             (pred_9 ?v10 ?v8)
             (pred_10 ?v9 ?v10 )
	     (pred_5 ?v10)
             (pred_12 ?v1)
             (pred_6 ?v7)
             (pred_8 ?v8)
             (pred_2 ?v10)
             (pred_7 ?v7)
             (pred_11 ?v10)
             (pred_3 ))



(:action op_5
:parameters (?v13 ?v6 ?v12 ?v11)
:precondition (and (pred_12 ?v13) (pred_12 ?v6) (pred_6 ?v12) (pred_8 ?v11)
          (pred_4 ?v13 ?v6) (pred_1 ?v12 ?v11)
                   (pred_9 ?v6 ?v11) (pred_5 ?v13) 
                   (pred_2 ?v6) (pred_7 ?v12))
:effect (and  (pred_11 ?v6) (not (pred_2 ?v6))))


(:action op_2
:parameters (?v13 ?v5)
:precondition (and (pred_12 ?v13) (pred_12 ?v5)
               (pred_5 ?v13) (pred_4 ?v13 ?v5) (pred_11 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v13))))

(:action op_1
:parameters (?v13 ?v12)
:precondition (and (pred_12 ?v13) (pred_6 ?v12) 
                  (pred_5 ?v13) (pred_10 ?v12 ?v13) (pred_3 ))
:effect (and (pred_7 ?v12)
   (not (pred_10 ?v12 ?v13)) (not (pred_3 ))))


(:action op_4
:parameters (?v13 ?v2 ?v3)
:precondition (and (pred_12 ?v13) (pred_6 ?v2) (pred_6 ?v3)
                  (pred_5 ?v13) (pred_7 ?v3) (pred_10 ?v2 ?v13))
:effect (and (pred_7 ?v2) (pred_10 ?v3 ?v13)
        (not (pred_7 ?v3)) (not (pred_10 ?v2 ?v13))))

(:action op_3
:parameters (?v13 ?v12)
:precondition (and (pred_12 ?v13) (pred_6 ?v12) 
                  (pred_5 ?v13) (pred_7 ?v12))
:effect (and (pred_3 ) (pred_10 ?v12 ?v13) (not (pred_7 ?v12)))))


	
