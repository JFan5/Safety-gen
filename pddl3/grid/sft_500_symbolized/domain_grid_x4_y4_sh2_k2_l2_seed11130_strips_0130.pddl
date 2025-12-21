(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v8)
             (pred_10 ?v9 ?v1)
             (pred_4 ?v2 ?v1)
             (pred_7 ?v10 ?v2 )
	     (pred_3 ?v2)
             (pred_5 ?v5)
             (pred_1 ?v9)
             (pred_11 ?v1)
             (pred_6 ?v2)
             (pred_2 ?v9)
             (pred_8 ?v2)
             (pred_9 ))



(:action op_1
:parameters (?v12 ?v13 ?v6 ?v4)
:precondition (and (pred_5 ?v12) (pred_5 ?v13) (pred_1 ?v6) (pred_11 ?v4)
          (pred_12 ?v12 ?v13) (pred_10 ?v6 ?v4)
                   (pred_4 ?v13 ?v4) (pred_3 ?v12) 
                   (pred_6 ?v13) (pred_2 ?v6))
:effect (and  (pred_8 ?v13) (not (pred_6 ?v13))))


(:action op_2
:parameters (?v12 ?v3)
:precondition (and (pred_5 ?v12) (pred_5 ?v3)
               (pred_3 ?v12) (pred_12 ?v12 ?v3) (pred_8 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v12))))

(:action op_5
:parameters (?v12 ?v6)
:precondition (and (pred_5 ?v12) (pred_1 ?v6) 
                  (pred_3 ?v12) (pred_7 ?v6 ?v12) (pred_9 ))
:effect (and (pred_2 ?v6)
   (not (pred_7 ?v6 ?v12)) (not (pred_9 ))))


(:action op_4
:parameters (?v12 ?v7 ?v11)
:precondition (and (pred_5 ?v12) (pred_1 ?v7) (pred_1 ?v11)
                  (pred_3 ?v12) (pred_2 ?v11) (pred_7 ?v7 ?v12))
:effect (and (pred_2 ?v7) (pred_7 ?v11 ?v12)
        (not (pred_2 ?v11)) (not (pred_7 ?v7 ?v12))))

(:action op_3
:parameters (?v12 ?v6)
:precondition (and (pred_5 ?v12) (pred_1 ?v6) 
                  (pred_3 ?v12) (pred_2 ?v6))
:effect (and (pred_9 ) (pred_7 ?v6 ?v12) (not (pred_2 ?v6)))))


	
