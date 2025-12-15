(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v10)
             (pred_11 ?v7 ?v3)
             (pred_9 ?v2 ?v3)
             (pred_6 ?v1 ?v2 )
	     (pred_4 ?v2)
             (pred_12 ?v9)
             (pred_3 ?v7)
             (pred_1 ?v3)
             (pred_7 ?v2)
             (pred_5 ?v7)
             (pred_8 ?v2)
             (pred_2 ))



(:action op_1
:parameters (?v13 ?v6 ?v4 ?v8)
:precondition (and (pred_12 ?v13) (pred_12 ?v6) (pred_3 ?v4) (pred_1 ?v8)
          (pred_10 ?v13 ?v6) (pred_11 ?v4 ?v8)
                   (pred_9 ?v6 ?v8) (pred_4 ?v13) 
                   (pred_7 ?v6) (pred_5 ?v4))
:effect (and  (pred_8 ?v6) (not (pred_7 ?v6))))


(:action op_3
:parameters (?v13 ?v11)
:precondition (and (pred_12 ?v13) (pred_12 ?v11)
               (pred_4 ?v13) (pred_10 ?v13 ?v11) (pred_8 ?v11))
:effect (and (pred_4 ?v11) (not (pred_4 ?v13))))

(:action op_5
:parameters (?v13 ?v4)
:precondition (and (pred_12 ?v13) (pred_3 ?v4) 
                  (pred_4 ?v13) (pred_6 ?v4 ?v13) (pred_2 ))
:effect (and (pred_5 ?v4)
   (not (pred_6 ?v4 ?v13)) (not (pred_2 ))))


(:action op_2
:parameters (?v13 ?v12 ?v5)
:precondition (and (pred_12 ?v13) (pred_3 ?v12) (pred_3 ?v5)
                  (pred_4 ?v13) (pred_5 ?v5) (pred_6 ?v12 ?v13))
:effect (and (pred_5 ?v12) (pred_6 ?v5 ?v13)
        (not (pred_5 ?v5)) (not (pred_6 ?v12 ?v13))))

(:action op_4
:parameters (?v13 ?v4)
:precondition (and (pred_12 ?v13) (pred_3 ?v4) 
                  (pred_4 ?v13) (pred_5 ?v4))
:effect (and (pred_2 ) (pred_6 ?v4 ?v13) (not (pred_5 ?v4)))))


	
