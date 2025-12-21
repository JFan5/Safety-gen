(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_10 obj_01 - type_2
obj_03 obj_07 obj_09 obj_05 - type_3
obj_02 obj_08 obj_06 - object)
(:init
(pred_1 obj_04 obj_03)
(pred_3 obj_04 obj_10)
(pred_3 obj_04 obj_01)
(pred_2 obj_02 obj_05)
(pred_2 obj_08 obj_03)
(pred_2 obj_06 obj_09)
)
(:goal
(and
(pred_2 obj_02 obj_05)
(pred_2 obj_08 obj_09)
(pred_2 obj_06 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_04 ?b obj_01))))
)
)