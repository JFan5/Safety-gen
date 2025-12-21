(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_01 obj_05 - type_2
obj_10 obj_09 obj_03 obj_02 - type_3
obj_07 obj_06 obj_04 - object)
(:init
(pred_1 obj_08 obj_10)
(pred_3 obj_08 obj_01)
(pred_3 obj_08 obj_05)
(pred_2 obj_07 obj_09)
(pred_2 obj_06 obj_10)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_06 obj_09)
(pred_2 obj_04 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_01))))
)
)