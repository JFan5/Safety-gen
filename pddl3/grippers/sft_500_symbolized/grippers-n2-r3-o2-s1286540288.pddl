(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_02 obj_09 - type_1
obj_11 obj_04 obj_01 obj_07 - type_2
obj_06 obj_10 obj_03 - type_3
obj_08 obj_05 - object)
(:init
(pred_1 obj_02 obj_03)
(pred_3 obj_02 obj_11)
(pred_3 obj_02 obj_04)
(pred_1 obj_09 obj_10)
(pred_3 obj_09 obj_01)
(pred_3 obj_09 obj_07)
(pred_2 obj_08 obj_10)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_08 obj_06)
(pred_2 obj_05 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_03) (pred_1 obj_09 obj_03))))
  )
)
)