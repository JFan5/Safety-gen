(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_08 obj_06 - type_3
obj_03 obj_09 obj_07 obj_05 - type_2
obj_01 obj_04 obj_10 - object)
(:init
(pred_4 obj_02 obj_03)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_06)
(pred_3 obj_01 obj_03)
(pred_3 obj_04 obj_05)
(pred_3 obj_10 obj_07)
)
(:goal
(and
(pred_3 obj_01 obj_07)
(pred_3 obj_04 obj_07)
(pred_3 obj_10 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_08))))
)
)