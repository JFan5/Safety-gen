; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 310913929 --problem-name spanner-s4-n3-l4-s310913929
(define (problem spanner-s4-n3-l4-s310913929)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_03 obj_12 obj_07 obj_08 - type_5
     obj_11 obj_10 obj_04 - type_1
     obj_09 obj_06 obj_01 obj_13 - type_3
     obj_14 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_02 obj_14)
    (pred_3 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_3 obj_12 obj_09)
    (pred_1 obj_12)
    (pred_3 obj_07 obj_06)
    (pred_1 obj_07)
    (pred_3 obj_08 obj_01)
    (pred_1 obj_08)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_05)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_05)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_05)
    (pred_4 obj_14 obj_09)
    (pred_4 obj_13 obj_05)
    (pred_4 obj_09 obj_06)
    (pred_4 obj_06 obj_01)
    (pred_4 obj_01 obj_13)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_10)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_14)))
  )
)
)
