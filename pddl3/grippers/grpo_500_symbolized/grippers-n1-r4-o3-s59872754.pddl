(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_03 obj_01 - type_3
obj_04 obj_09 obj_05 obj_10 - type_2
obj_06 obj_08 obj_07 - object)
(:init
(pred_4 obj_02 obj_09)
(pred_2 obj_02 obj_03)
(pred_2 obj_02 obj_01)
(pred_3 obj_06 obj_05)
(pred_3 obj_08 obj_10)
(pred_3 obj_07 obj_04)
)
(:goal
(and
(pred_3 obj_06 obj_10)
(pred_3 obj_08 obj_04)
(pred_3 obj_07 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_01))))
)
)