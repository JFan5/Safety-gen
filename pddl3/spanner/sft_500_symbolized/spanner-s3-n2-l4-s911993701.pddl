; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 911993701 --problem-name spanner-s3-n2-l4-s911993701
(define (problem spanner-s3-n2-l4-s911993701)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_08 obj_12 obj_04 - type_1
     obj_01 obj_11 - type_2
     obj_07 obj_05 obj_10 obj_09 - type_5
     obj_06 obj_03 - type_5
    )
 (:init 
    (pred_3 obj_02 obj_06)
    (pred_3 obj_08 obj_07)
    (pred_5 obj_08)
    (pred_3 obj_12 obj_07)
    (pred_5 obj_12)
    (pred_3 obj_04 obj_10)
    (pred_5 obj_04)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_03)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_03)
    (pred_2 obj_06 obj_07)
    (pred_2 obj_09 obj_03)
    (pred_2 obj_07 obj_05)
    (pred_2 obj_05 obj_10)
    (pred_2 obj_10 obj_09)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
