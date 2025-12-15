(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v2 ?v3)
             (pred_7 ?v12 ?v6)
             (pred_2 ?v2 ?v6)
             (pred_3 ?v10 ?v2 )
	     (pred_8 ?v2)
             (pred_6 ?v1)
             (pred_12 ?v12)
             (pred_4 ?v6)
             (pred_1 ?v2)
             (pred_10 ?v12)
             (pred_9 ?v2)
             (pred_5 ))



(:action op_3
:parameters (?v13 ?v7 ?v5 ?v11)
:precondition (and (pred_6 ?v13) (pred_6 ?v7) (pred_12 ?v5) (pred_4 ?v11)
          (pred_11 ?v13 ?v7) (pred_7 ?v5 ?v11)
                   (pred_2 ?v7 ?v11) (pred_8 ?v13) 
                   (pred_1 ?v7) (pred_10 ?v5))
:effect (and  (pred_9 ?v7) (not (pred_1 ?v7))))


(:action op_2
:parameters (?v13 ?v4)
:precondition (and (pred_6 ?v13) (pred_6 ?v4)
               (pred_8 ?v13) (pred_11 ?v13 ?v4) (pred_9 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v13))))

(:action op_1
:parameters (?v13 ?v5)
:precondition (and (pred_6 ?v13) (pred_12 ?v5) 
                  (pred_8 ?v13) (pred_3 ?v5 ?v13) (pred_5 ))
:effect (and (pred_10 ?v5)
   (not (pred_3 ?v5 ?v13)) (not (pred_5 ))))


(:action op_5
:parameters (?v13 ?v9 ?v8)
:precondition (and (pred_6 ?v13) (pred_12 ?v9) (pred_12 ?v8)
                  (pred_8 ?v13) (pred_10 ?v8) (pred_3 ?v9 ?v13))
:effect (and (pred_10 ?v9) (pred_3 ?v8 ?v13)
        (not (pred_10 ?v8)) (not (pred_3 ?v9 ?v13))))

(:action op_4
:parameters (?v13 ?v5)
:precondition (and (pred_6 ?v13) (pred_12 ?v5) 
                  (pred_8 ?v13) (pred_10 ?v5))
:effect (and (pred_5 ) (pred_3 ?v5 ?v13) (not (pred_10 ?v5)))))


	
