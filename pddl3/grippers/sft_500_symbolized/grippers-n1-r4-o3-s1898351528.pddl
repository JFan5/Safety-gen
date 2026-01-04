(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_09 obj_02 - type_3
obj_05 obj_04 obj_10 obj_06 - type_2
obj_08 obj_07 obj_01 - object)
(:init
(pred_3 obj_03 obj_10)
(pred_2 obj_03 obj_09)
(pred_2 obj_03 obj_02)
(pred_4 obj_08 obj_06)
(pred_4 obj_07 obj_06)
(pred_4 obj_01 obj_05)
)
(:goal
(and
(pred_4 obj_08 obj_05)
(pred_4 obj_07 obj_04)
(pred_4 obj_01 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_02))))
)
)