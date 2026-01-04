(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_05 obj_09 - type_1
obj_02 obj_03 obj_06 - type_2
obj_01 obj_04 obj_08 - object)
(:init
(pred_2 obj_07 obj_06)
(pred_1 obj_07 obj_05)
(pred_1 obj_07 obj_09)
(pred_4 obj_01 obj_02)
(pred_4 obj_04 obj_02)
(pred_4 obj_08 obj_03)
)
(:goal
(and
(pred_4 obj_01 obj_02)
(pred_4 obj_04 obj_02)
(pred_4 obj_08 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_07 ?b obj_09))))
)
)