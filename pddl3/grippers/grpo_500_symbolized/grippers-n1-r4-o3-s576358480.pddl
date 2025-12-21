(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_05 obj_07 - type_3
obj_06 obj_01 obj_10 obj_08 - type_2
obj_03 obj_09 obj_04 - object)
(:init
(pred_4 obj_02 obj_01)
(pred_2 obj_02 obj_05)
(pred_2 obj_02 obj_07)
(pred_3 obj_03 obj_08)
(pred_3 obj_09 obj_10)
(pred_3 obj_04 obj_08)
)
(:goal
(and
(pred_3 obj_03 obj_10)
(pred_3 obj_09 obj_01)
(pred_3 obj_04 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_05))))
)
)