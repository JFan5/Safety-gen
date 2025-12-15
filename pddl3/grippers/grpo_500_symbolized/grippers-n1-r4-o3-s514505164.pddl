(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_05 obj_02 - type_3
obj_09 obj_06 obj_03 obj_10 - type_2
obj_01 obj_04 obj_07 - object)
(:init
(pred_3 obj_08 obj_06)
(pred_4 obj_08 obj_05)
(pred_4 obj_08 obj_02)
(pred_2 obj_01 obj_09)
(pred_2 obj_04 obj_03)
(pred_2 obj_07 obj_10)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_04 obj_10)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_02))))
)
)