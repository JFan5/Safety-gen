(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_3
obj_07 obj_04 - type_1
obj_05 obj_10 obj_06 obj_08 - type_2
obj_03 obj_02 obj_09 - object)
(:init
(pred_3 obj_01 obj_10)
(pred_4 obj_01 obj_07)
(pred_4 obj_01 obj_04)
(pred_2 obj_03 obj_06)
(pred_2 obj_02 obj_06)
(pred_2 obj_09 obj_05)
)
(:goal
(and
(pred_2 obj_03 obj_06)
(pred_2 obj_02 obj_10)
(pred_2 obj_09 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_01 ?b obj_04))))
)
)