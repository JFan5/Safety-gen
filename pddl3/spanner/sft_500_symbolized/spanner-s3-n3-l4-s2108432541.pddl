; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2108432541 --problem-name spanner-s3-n3-l4-s2108432541
(define (problem spanner-s3-n3-l4-s2108432541)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_06 obj_09 obj_13 - type_5
     obj_08 obj_04 obj_10 - type_1
     obj_01 obj_07 obj_12 obj_03 - type_3
     obj_05 obj_02 - type_3
    )
 (:init 
    (pred_6 obj_11 obj_05)
    (pred_6 obj_06 obj_03)
    (pred_4 obj_06)
    (pred_6 obj_09 obj_03)
    (pred_4 obj_09)
    (pred_6 obj_13 obj_03)
    (pred_4 obj_13)
    (pred_1 obj_08)
    (pred_6 obj_08 obj_02)
    (pred_1 obj_04)
    (pred_6 obj_04 obj_02)
    (pred_1 obj_10)
    (pred_6 obj_10 obj_02)
    (pred_2 obj_05 obj_01)
    (pred_2 obj_03 obj_02)
    (pred_2 obj_01 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_2 obj_12 obj_03)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_04)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
