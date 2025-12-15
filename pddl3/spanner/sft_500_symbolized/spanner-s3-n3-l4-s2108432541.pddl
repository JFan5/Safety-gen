; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2108432541 --problem-name spanner-s3-n3-l4-s2108432541
(define (problem spanner-s3-n3-l4-s2108432541)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_11 obj_02 obj_05 - type_2
     obj_06 obj_01 obj_03 - type_3
     obj_12 obj_10 obj_13 obj_07 - type_5
     obj_04 obj_08 - type_5
    )
 (:init 
    (pred_6 obj_09 obj_04)
    (pred_6 obj_11 obj_07)
    (pred_3 obj_11)
    (pred_6 obj_02 obj_07)
    (pred_3 obj_02)
    (pred_6 obj_05 obj_07)
    (pred_3 obj_05)
    (pred_5 obj_06)
    (pred_6 obj_06 obj_08)
    (pred_5 obj_01)
    (pred_6 obj_01 obj_08)
    (pred_5 obj_03)
    (pred_6 obj_03 obj_08)
    (pred_4 obj_04 obj_12)
    (pred_4 obj_07 obj_08)
    (pred_4 obj_12 obj_10)
    (pred_4 obj_10 obj_13)
    (pred_4 obj_13 obj_07)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_01)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
