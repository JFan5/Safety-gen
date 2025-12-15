(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_3
obj_03 obj_08 - type_1
obj_01 obj_04 obj_07 obj_10 - type_2
obj_02 obj_06 obj_09 - object)
(:init
(pred_3 obj_05 obj_10)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_08)
(pred_1 obj_02 obj_01)
(pred_1 obj_06 obj_04)
(pred_1 obj_09 obj_10)
)
(:goal
(and
(pred_1 obj_02 obj_04)
(pred_1 obj_06 obj_01)
(pred_1 obj_09 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_08))))
)
)