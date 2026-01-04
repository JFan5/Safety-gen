(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_3
obj_06 obj_01 - type_1
obj_09 obj_03 obj_02 - type_2
obj_07 obj_05 obj_04 - object)
(:init
(pred_1 obj_08 obj_09)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_01)
(pred_4 obj_07 obj_09)
(pred_4 obj_05 obj_02)
(pred_4 obj_04 obj_03)
)
(:goal
(and
(pred_4 obj_07 obj_02)
(pred_4 obj_05 obj_09)
(pred_4 obj_04 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_08 ?b obj_01))))
)
)