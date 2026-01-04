(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_2
obj_04 obj_03 - type_1
obj_08 obj_10 obj_06 obj_05 - type_3
obj_09 obj_07 obj_02 - object)
(:init
(pred_2 obj_01 obj_08)
(pred_3 obj_01 obj_04)
(pred_3 obj_01 obj_03)
(pred_1 obj_09 obj_08)
(pred_1 obj_07 obj_06)
(pred_1 obj_02 obj_08)
)
(:goal
(and
(pred_1 obj_09 obj_05)
(pred_1 obj_07 obj_10)
(pred_1 obj_02 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_04))))
)
)