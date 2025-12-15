; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 380895850 --problem-name spanner-s4-n3-l4-s380895850
(define (problem spanner-s4-n3-l4-s380895850)
 (:domain spanner)
 (:objects 
     obj_12 - type_1
     obj_02 obj_09 obj_07 obj_14 - type_5
     obj_11 obj_08 obj_04 - type_3
     obj_06 obj_05 obj_03 obj_01 - type_4
     obj_10 obj_13 - type_4
    )
 (:init 
    (pred_3 obj_12 obj_10)
    (pred_3 obj_02 obj_03)
    (pred_2 obj_02)
    (pred_3 obj_09 obj_03)
    (pred_2 obj_09)
    (pred_3 obj_07 obj_03)
    (pred_2 obj_07)
    (pred_3 obj_14 obj_03)
    (pred_2 obj_14)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_13)
    (pred_6 obj_08)
    (pred_3 obj_08 obj_13)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_13)
    (pred_5 obj_10 obj_06)
    (pred_5 obj_01 obj_13)
    (pred_5 obj_06 obj_05)
    (pred_5 obj_05 obj_03)
    (pred_5 obj_03 obj_01)
)
 (:goal
  (and
   (pred_4 obj_11)
   (pred_4 obj_08)
   (pred_4 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
