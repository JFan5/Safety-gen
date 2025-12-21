(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v10 ?v1)
             (pred_2 ?v9 ?v6)
             (pred_7 ?v10 ?v6)
             (pred_6 ?v5 ?v10 )
	     (pred_3 ?v10)
             (pred_4 ?v11)
             (pred_9 ?v9)
             (pred_11 ?v6)
             (pred_5 ?v10)
             (pred_1 ?v9)
             (pred_12 ?v10)
             (pred_8 ))



(:action op_2
:parameters (?v13 ?v7 ?v4 ?v12)
:precondition (and (pred_4 ?v13) (pred_4 ?v7) (pred_9 ?v4) (pred_11 ?v12)
          (pred_10 ?v13 ?v7) (pred_2 ?v4 ?v12)
                   (pred_7 ?v7 ?v12) (pred_3 ?v13) 
                   (pred_5 ?v7) (pred_1 ?v4))
:effect (and  (pred_12 ?v7) (not (pred_5 ?v7))))


(:action op_4
:parameters (?v13 ?v3)
:precondition (and (pred_4 ?v13) (pred_4 ?v3)
               (pred_3 ?v13) (pred_10 ?v13 ?v3) (pred_12 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v13))))

(:action op_1
:parameters (?v13 ?v4)
:precondition (and (pred_4 ?v13) (pred_9 ?v4) 
                  (pred_3 ?v13) (pred_6 ?v4 ?v13) (pred_8 ))
:effect (and (pred_1 ?v4)
   (not (pred_6 ?v4 ?v13)) (not (pred_8 ))))


(:action op_5
:parameters (?v13 ?v2 ?v8)
:precondition (and (pred_4 ?v13) (pred_9 ?v2) (pred_9 ?v8)
                  (pred_3 ?v13) (pred_1 ?v8) (pred_6 ?v2 ?v13))
:effect (and (pred_1 ?v2) (pred_6 ?v8 ?v13)
        (not (pred_1 ?v8)) (not (pred_6 ?v2 ?v13))))

(:action op_3
:parameters (?v13 ?v4)
:precondition (and (pred_4 ?v13) (pred_9 ?v4) 
                  (pred_3 ?v13) (pred_1 ?v4))
:effect (and (pred_8 ) (pred_6 ?v4 ?v13) (not (pred_1 ?v4)))))


	
