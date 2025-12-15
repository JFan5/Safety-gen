(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v10 ?v8)
             (pred_9 ?v7 ?v5)
             (pred_11 ?v10 ?v5)
             (pred_4 ?v1 ?v10 )
	     (pred_12 ?v10)
             (pred_1 ?v12)
             (pred_8 ?v7)
             (pred_3 ?v5)
             (pred_2 ?v10)
             (pred_10 ?v7)
             (pred_5 ?v10)
             (pred_6 ))



(:action op_4
:parameters (?v4 ?v13 ?v2 ?v11)
:precondition (and (pred_1 ?v4) (pred_1 ?v13) (pred_8 ?v2) (pred_3 ?v11)
          (pred_7 ?v4 ?v13) (pred_9 ?v2 ?v11)
                   (pred_11 ?v13 ?v11) (pred_12 ?v4) 
                   (pred_2 ?v13) (pred_10 ?v2))
:effect (and  (pred_5 ?v13) (not (pred_2 ?v13))))


(:action op_2
:parameters (?v4 ?v9)
:precondition (and (pred_1 ?v4) (pred_1 ?v9)
               (pred_12 ?v4) (pred_7 ?v4 ?v9) (pred_5 ?v9))
:effect (and (pred_12 ?v9) (not (pred_12 ?v4))))

(:action op_3
:parameters (?v4 ?v2)
:precondition (and (pred_1 ?v4) (pred_8 ?v2) 
                  (pred_12 ?v4) (pred_4 ?v2 ?v4) (pred_6 ))
:effect (and (pred_10 ?v2)
   (not (pred_4 ?v2 ?v4)) (not (pred_6 ))))


(:action op_5
:parameters (?v4 ?v6 ?v3)
:precondition (and (pred_1 ?v4) (pred_8 ?v6) (pred_8 ?v3)
                  (pred_12 ?v4) (pred_10 ?v3) (pred_4 ?v6 ?v4))
:effect (and (pred_10 ?v6) (pred_4 ?v3 ?v4)
        (not (pred_10 ?v3)) (not (pred_4 ?v6 ?v4))))

(:action op_1
:parameters (?v4 ?v2)
:precondition (and (pred_1 ?v4) (pred_8 ?v2) 
                  (pred_12 ?v4) (pred_10 ?v2))
:effect (and (pred_6 ) (pred_4 ?v2 ?v4) (not (pred_10 ?v2)))))


	
