(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_03 obj_01 - type_2
obj_09 obj_06 obj_05 - type_3
obj_04 obj_08 obj_02 - object)
(:init
(pred_1 obj_07 obj_06)
(pred_3 obj_07 obj_03)
(pred_3 obj_07 obj_01)
(pred_2 obj_04 obj_06)
(pred_2 obj_08 obj_05)
(pred_2 obj_02 obj_06)
)
(:goal
(and
(pred_2 obj_04 obj_09)
(pred_2 obj_08 obj_09)
(pred_2 obj_02 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_07 ?b obj_01))))
)
)