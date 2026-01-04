; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 310913929 --problem-name spanner-s4-n3-l4-s310913929
(define (problem spanner-s4-n3-l4-s310913929)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_10 obj_03 obj_07 obj_06 - type_3
     obj_11 obj_05 obj_09 - type_1
     obj_02 obj_12 obj_01 obj_04 - type_2
     obj_14 obj_08 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_14)
    (pred_2 obj_10 obj_12)
    (pred_6 obj_10)
    (pred_2 obj_03 obj_02)
    (pred_6 obj_03)
    (pred_2 obj_07 obj_12)
    (pred_6 obj_07)
    (pred_2 obj_06 obj_01)
    (pred_6 obj_06)
    (pred_4 obj_11)
    (pred_2 obj_11 obj_08)
    (pred_4 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_4 obj_09)
    (pred_2 obj_09 obj_08)
    (pred_5 obj_14 obj_02)
    (pred_5 obj_04 obj_08)
    (pred_5 obj_02 obj_12)
    (pred_5 obj_12 obj_01)
    (pred_5 obj_01 obj_04)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_05)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_14)))
  )
)
)
