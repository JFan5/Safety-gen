(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v5)
             (pred_4 ?v1 ?v8)
             (pred_3 ?v2 ?v8)
             (pred_7 ?v9 ?v2 )
	     (pred_10 ?v2)
             (pred_8 ?v10)
             (pred_5 ?v1)
             (pred_11 ?v8)
             (pred_6 ?v2)
             (pred_1 ?v1)
             (pred_12 ?v2)
             (pred_2 ))



(:action op_1
:parameters (?v13 ?v3 ?v4 ?v7)
:precondition (and (pred_8 ?v13) (pred_8 ?v3) (pred_5 ?v4) (pred_11 ?v7)
          (pred_9 ?v13 ?v3) (pred_4 ?v4 ?v7)
                   (pred_3 ?v3 ?v7) (pred_10 ?v13) 
                   (pred_6 ?v3) (pred_1 ?v4))
:effect (and  (pred_12 ?v3) (not (pred_6 ?v3))))


(:action op_3
:parameters (?v13 ?v6)
:precondition (and (pred_8 ?v13) (pred_8 ?v6)
               (pred_10 ?v13) (pred_9 ?v13 ?v6) (pred_12 ?v6))
:effect (and (pred_10 ?v6) (not (pred_10 ?v13))))

(:action op_4
:parameters (?v13 ?v4)
:precondition (and (pred_8 ?v13) (pred_5 ?v4) 
                  (pred_10 ?v13) (pred_7 ?v4 ?v13) (pred_2 ))
:effect (and (pred_1 ?v4)
   (not (pred_7 ?v4 ?v13)) (not (pred_2 ))))


(:action op_5
:parameters (?v13 ?v11 ?v12)
:precondition (and (pred_8 ?v13) (pred_5 ?v11) (pred_5 ?v12)
                  (pred_10 ?v13) (pred_1 ?v12) (pred_7 ?v11 ?v13))
:effect (and (pred_1 ?v11) (pred_7 ?v12 ?v13)
        (not (pred_1 ?v12)) (not (pred_7 ?v11 ?v13))))

(:action op_2
:parameters (?v13 ?v4)
:precondition (and (pred_8 ?v13) (pred_5 ?v4) 
                  (pred_10 ?v13) (pred_1 ?v4))
:effect (and (pred_2 ) (pred_7 ?v4 ?v13) (not (pred_1 ?v4)))))


	
