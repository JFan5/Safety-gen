; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 310913929 --problem-name spanner-s4-n3-l4-s310913929
(define (problem spanner-s4-n3-l4-s310913929)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_13 obj_06 obj_01 obj_10 - type_1
     obj_14 obj_03 obj_11 - type_5
     obj_12 obj_04 obj_08 obj_09 - type_2
     obj_07 obj_05 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_07)
    (pred_6 obj_13 obj_04)
    (pred_5 obj_13)
    (pred_6 obj_06 obj_12)
    (pred_5 obj_06)
    (pred_6 obj_01 obj_04)
    (pred_5 obj_01)
    (pred_6 obj_10 obj_08)
    (pred_5 obj_10)
    (pred_3 obj_14)
    (pred_6 obj_14 obj_05)
    (pred_3 obj_03)
    (pred_6 obj_03 obj_05)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_05)
    (pred_1 obj_07 obj_12)
    (pred_1 obj_09 obj_05)
    (pred_1 obj_12 obj_04)
    (pred_1 obj_04 obj_08)
    (pred_1 obj_08 obj_09)
)
 (:goal
  (and
   (pred_2 obj_14)
   (pred_2 obj_03)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_14)) (not (pred_2 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
