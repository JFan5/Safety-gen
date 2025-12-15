; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 301283283 --problem-name spanner-s4-n3-l4-s301283283
(define (problem spanner-s4-n3-l4-s301283283)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_09 obj_03 obj_07 obj_05 - type_2
     obj_06 obj_13 obj_12 - type_4
     obj_04 obj_11 obj_14 obj_08 - type_1
     obj_01 obj_10 - type_1
    )
 (:init 
    (pred_6 obj_02 obj_01)
    (pred_6 obj_09 obj_14)
    (pred_1 obj_09)
    (pred_6 obj_03 obj_08)
    (pred_1 obj_03)
    (pred_6 obj_07 obj_14)
    (pred_1 obj_07)
    (pred_6 obj_05 obj_14)
    (pred_1 obj_05)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_10)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_10)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_10)
    (pred_3 obj_01 obj_04)
    (pred_3 obj_08 obj_10)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_11 obj_14)
    (pred_3 obj_14 obj_08)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_13)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_13)) (not (pred_5 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
