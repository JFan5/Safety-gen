(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_03 obj_01 - type_3
obj_05 obj_04 obj_02 obj_07 - type_2
obj_06 obj_09 obj_08 - object)
(:init
(pred_4 obj_10 obj_04)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_01)
(pred_3 obj_06 obj_05)
(pred_3 obj_09 obj_04)
(pred_3 obj_08 obj_07)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_09 obj_07)
(pred_3 obj_08 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_10 ?b obj_01))))
)
)