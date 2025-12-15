(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_2
obj_06 obj_01 - type_3
obj_09 obj_04 obj_05 obj_03 - type_1
obj_02 obj_10 obj_08 - object)
(:init
(pred_1 obj_07 obj_03)
(pred_2 obj_07 obj_06)
(pred_2 obj_07 obj_01)
(pred_4 obj_02 obj_09)
(pred_4 obj_10 obj_09)
(pred_4 obj_08 obj_09)
)
(:goal
(and
(pred_4 obj_02 obj_03)
(pred_4 obj_10 obj_04)
(pred_4 obj_08 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_07 ?b obj_01))))
)
)